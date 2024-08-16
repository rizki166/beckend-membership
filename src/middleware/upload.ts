import { NextFunction, Request, Response } from "express";
import multer from "multer";
import path from "path";

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, path.join(__dirname, "../uploads"));
  },
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now() + "-" + Math.round(Math.random() * 1e9);
    cb(
      null,
      file.fieldname + "-" + uniqueSuffix + file.originalname.replace(/\s/g, "")
    );
  },
});

const upload = multer({
  storage: storage,
  limits: {
    fileSize: 100 * 1024 * 1024, 
  },
  fileFilter: function (req, file, cb) {
    const allowedTypes = /mp4|mkv|avi|mov|wmv/;
    const extname = allowedTypes.test(
      path.extname(file.originalname).toLowerCase()
    );
    const mimetype = allowedTypes.test(file.mimetype);

    if (mimetype && extname) {
      return cb(null, true);
    }
    cb(new Error("Only video files are allowed!"));
  },
}).single("url");
const uploadMiddleware = (fieldname: string) => {
  return async (req: Request, res: Response, next: NextFunction) => {
    upload(req, res, (err) => {
      if (err instanceof multer.MulterError) {
        if (err.code === "LIMIT_FILE_SIZE") {
          return res.status(400).json({
            status: false,
            message: "File size is too large",
          });
        }
        return res.status(500).json({
          status: false,
          message: err.message,
        });
      }
      return next();
    });
  };
};

export default uploadMiddleware;

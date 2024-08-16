import { Request, Response } from "express";
import * as userService from "../services/userService";
export const register = async (req: Request, res: Response) => {
  try {
    const { email, password, membershipType } = req.body;
    const user = await userService.register(password, email, membershipType);
    res.status(201).json({
      status: true,
      message: "User created successfully",
      user,
    });
  } catch (error) {
    res.status(500).json({
      status: false,
      message: error,
    });
  }
};

export const login = async (req: Request, res: Response) => {
  try {
    const { email, password } = req.body;
    const { token, user } = await userService.login(email, password);

    res.status(200).json({
      status: true,
      message: "User logged in successfully",
      token,
      user, 
    });
  } catch (error: any) {
    console.error("Login error:", error);
    res.status(500).json({
      status: false,
      message: error.message || "An error occurred during login",
    });
  }
};
export const getUsers = async (req: Request, res: Response) => {
  try {
    const users = await userService.getUsers();
    res.status(200).json({
      status: true,
      message: "Get users success",
      users,
    });
  } catch (error) {
    res.status(500).json({
      status: false,
      message: error,
    });
  }
};
export const getUser = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const user = await userService.getUser(parseInt(id));
    res.status(200).json({
      status: true,
      message: "Get user success",
      user,
    });
  } catch (error) {
    res.status(500).json({
      status: false,
      message: error,
    });
  }
};

export const updateUser = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { password, email, membershipType } = req.body;
    const user = await userService.updateUser(
      parseInt(id),
      password,
      email,
      membershipType
    );
    res.status(200).json({
      status: true,
      message: "Update user success",
      user,
    });
  } catch (error) {
    res.status(500).json({
      status: false,
      message: error,
    });
  }
};

import prisma from "../db";
import { Role } from "../types/app";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
export const getUsers = async () => {
  try {
    const users = await prisma.user.findMany();
    return users;
  } catch (error) {
    console.error("Error during getUsers:", error);
    throw error;
  }
};

export const getUser = async (id: number) => {
  try {
    const user = await prisma.user.findUnique({
      where: { id },
    });
    return user;
  } catch (error) {
    console.error("Error during getUser:", error);
    throw error;
  }
};
export const register = async (
  password: string,
  email: string,
  membershipType?: Role
) => {
  try {
    const user = await prisma.user.create({
      data: {
        password,
        email,
        membershipType,
      },
    });
    return user;
  } catch (error) {
    console.error("Error during createUser:", error);
    throw error;
  }
};

export const updateUser = async (
  id: number,
  password: string,
  email: string,
  membershipType?: Role
) => {
  try {
    const hashedPassword = await bcrypt.hash(password, 10);
    const user = await prisma.user.update({
      where: { id },
      data: {
        password: hashedPassword,
        email,
        membershipType,
      },
    });
    return user;
  } catch (error) {
    throw error;
  }
};

export const login = async (email: string, password: string) => {
  try {
    
    const user = await prisma.user.findUnique({
      where: { email },
    });

    if (!user) throw new Error("User not found");

    const token = jwt.sign({ id: user.id }, "secret", { expiresIn: "1h" });
    return {
      token,
      user: {
        id: user.id,
        email: user.email,
        membershipType: user.membershipType,
      },
    };
  } catch (error) {
    throw error;
  }
};

export type AuthMiddlewareData = {
  id: string;
};
export enum Role {
  A = "A",
  B = "B",
  C = "C",
}

export interface IVideo {
  id: number;
  title: string;
  description: string;
  url: string;
}

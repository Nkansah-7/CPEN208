"use client";

import React from "react";

import {
  LayoutDashboard,
  User,
  Wallet,
  Book,
  LucideIcon,
  LogOutIcon,
} from "lucide-react";
import Sidebaritem from "./item";
import SidebarItem from "./item";

interface Sidebaritem {
  name: string;
  icon: LucideIcon;
  path: string;
  items?: SubItem[];
}

interface SubItem {
  name: string;
  path: string;
}

const items: Sidebaritem[] = [
  {
    name: "Home",
    path: "/dashboard/home",
    icon: LayoutDashboard,
  },
  {
    name: "Profile",
    path: "/dashboard/profile",
    icon: User,
  },
  {
    name: "Finance info",
    path: "/dashboard/financial_info",
    icon: Wallet,
  },
  {
    name: "Register Courses",
    path: "/dashboard/register_courses",
    icon: Book,
  },
  {
    name: "Log Out",
    icon: LogOutIcon,
    path: "/signIn",
  },
];
const Sidebar = () => {
  return (
    <div className="fixed top-0 h-screen w-64 bg-white shadow-lg z-10 p-6">
      <div className="flex flex-col space-y-10 w-full">
        <div className="flex flex-col space-y-5 ">
          {items.map((item) => (
            <SidebarItem key={item.path} item={item} />
          ))}
        </div>
      </div>
    </div>
  );
};

export default Sidebar;

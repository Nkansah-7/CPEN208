import Head from "next/head";
import Sidebar from '@/app/(dashboard)/admin/sidebar';

interface CustomLayoutProps {
  children: React.ReactNode;
}

const CustomLayout: React.FC<CustomLayoutProps> = ({ children }) => {
  return (
    <div className="custom-layout">
      <div className="flex h-screen w-full bg-gray-200">
        <Sidebar/>
        <div className="flex flex-col w-full h-full ml-64 p-4">{children}</div>
      </div>
    </div>
  );
};
export default CustomLayout;

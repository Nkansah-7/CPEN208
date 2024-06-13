import Link from 'next/link';
import { Button, buttonVariants } from './ui/button';
import { HandMetal } from 'lucide-react';
import { getServerSession } from 'next-auth';
import { authOptions } from '@/lib/auth';
import { signOut } from 'next-auth/react';
import UserAccountnav from './UserAccountnav';

const Navbar = async () => {
  const session = await getServerSession(authOptions);
  return (
    <div className='bg-zinc-100 py-2 border-b border-s-zinc-200 fixed w-full z-10 top-0'>
      <div className='container flex items-center justify-between'>
        <div className='flex items-center space-x-4'>
          <Link href='/'>
            <HandMetal />
          </Link>
          <Link href='/about' className='text-gray-700 hover:text-gray-900'>
            About
          </Link>
        </div>
        <div className='flex items-center space-x-4'>
          {session?.user ? (
            <UserAccountnav />
          ) : (
            <>
              <Link className={buttonVariants()} href='/sign-in'>
                Sign in
              </Link>
              <Link className={buttonVariants()} href='/sign-up'>
                Sign up
              </Link>
            </>
          )}
        </div>
      </div>
    </div>
  );
};

export default Navbar;

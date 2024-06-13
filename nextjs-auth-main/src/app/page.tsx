import { buttonVariants } from '@/components/ui/button';
import Link from 'next/link'
import Image from 'next/image';


export default function Home() {
  return (
    
    <div
      style={{
        backgroundColor: 'black',
        color: 'white',
        padding: '20px',
        width: '85vw',
        height: '85vh',
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
        justifyContent: 'center',
      }}
    >
      
     
      <h1 className='text-3xl'>School of Engineering Sciences</h1>
      
      <Image  src="/sesno_bg.png" className='rounded-lg' alt="SES logo" width={325} height={325} />
      <h1 className='text-4xl'>Home</h1>
      <Link className={buttonVariants()} href='/admin'>Open My Admin</Link>
      
      
    </div>
  );
} 
import {env} from 'cloudflare:workers';
export function database(){if(!env.DB)throw Error('Database unavailable');return env.DB;}
export function bucket(){if(!(env as any).BUCKET)throw Error('Storage unavailable');return (env as any).BUCKET as R2Bucket;}

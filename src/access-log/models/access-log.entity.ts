import { Column, Entity, PrimaryGeneratedColumn, ManyToOne } from 'typeorm';
import { _dbemployee } from '../../employee-list/models/employee.entity';

@Entity()
export class _dbaccesslog {
  @PrimaryGeneratedColumn()
  id: number;

  @ManyToOne(() => _dbemployee, employee => employee.accessLogs)
  employee: _dbemployee;

  @Column()
  rfidtag: string;

  @Column() 
  accessDateTime: string;

  @Column()
  accessType: string; // 'In' or 'Out'

  @Column()
  roleAtAccess: string; // Role of the employee at the time of access

  @Column({ nullable: true})
  fingerprint1: string;

  @Column({ nullable: true})
  fingerprint2: string;
}

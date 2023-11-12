import { HTMLInputTypeAttribute } from 'react';
import classes from '@/components/ui/WorkOrderInput.module.css';

interface WorkOrderInput {
  type: HTMLInputTypeAttribute;
  name: string;
  label: string;
}

const WorkOrderInput = ({ type, name, label }: WorkOrderInput) => {
  return (
    <fieldset>
      <label htmlFor={name}>{label}</label>
      <input className={classes['workorder-input']} name={name} type={type} />
    </fieldset>
  );
};

export default WorkOrderInput;

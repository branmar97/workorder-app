import { HTMLInputTypeAttribute } from 'react';
import classes from '@/components/ui/WorkOrderInput.module.css';

interface WorkOrderInputProps {
  type: HTMLInputTypeAttribute;
  name: string;
  label?: string;
}

// TODO: Add theme styles

/**
 * Functional react component for displaying input
 *
 * @example
 * // Usage:
 * // <WorkOrderInput type='text' name='fName' label='First Name' />
 *
 * @param {WorkOrderInputProps} props - React props
 * @returns {JSX.Element} - Rendered WorkOrderInput Component
 */
const WorkOrderInput = ({ type, name, label }: WorkOrderInputProps) => {
  return (
    <fieldset>
      {label && <label htmlFor={name}>{label}</label>}
      <input className={classes['workorder-input']} name={name} type={type} />
    </fieldset>
  );
};

export default WorkOrderInput;

import classes from '@/components/ui/WorkOrderInput.module.css';

interface WorkOrderInputProps {
  label?: string;
  name: string;
  placeholder: string;
  type: 'number' | 'text';
}

// TODO: Add theme styles

/**
 * Functional react component for displaying input
 *
 * @example
 * // Usage:
 * // <WorkOrderInput type='text' name='fName' label='First Name' placeholder='Enter your first name' />
 *
 * @param {WorkOrderInputProps} props - React props
 * @returns {JSX.Element} - Rendered WorkOrderInput Component
 */
const WorkOrderInput = ({
  type,
  name,
  label,
  placeholder
}: WorkOrderInputProps) => {
  return (
    <div>
      {label && (
        <label className={classes['workorder-label']} htmlFor={name}>
          {label}
        </label>
      )}
      <input
        className={classes['workorder-input']}
        name={name}
        type={type}
        placeholder={placeholder}
      />
    </div>
  );
};

export default WorkOrderInput;

import classes from './WorkOrderButton.module.css';

interface WorkOrderButtonProps {
  buttonText: string;
  buttonType: 'submit' | 'cancel' | 'close';
  onClick?: Function;
}
// TODO: Add theme styles and hover styles, create better type definition for onClick

/**
 * Functional react component for displaying button
 *
 * @example
 * // Usage:
 * // <WorkOrderButton buttonType='submit' buttonText='Submit' />
 *
 * @param {WorkOrderButtonProps} props - React props
 * @returns {JSX.Element} - Rendered WorkOrderButton Component
 */
const WorkOrderButton = ({
  buttonText,
  buttonType,
  onClick
}: WorkOrderButtonProps) => {
  return (
    <button
      className={`${
        buttonType === 'submit' || buttonType === 'close'
          ? classes.submit
          : classes.cancel
      }`}
      onClick={() => onClick && buttonType === 'close' && onClick(false)}
    >
      {buttonText}
    </button>
  );
};

export default WorkOrderButton;

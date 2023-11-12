import classes from './WorkOrderButton.module.css';

interface WorkOrderButtonProps {
  buttonText: string;
  buttonType: 'submit' | 'cancel';
}
// TODO: Add theme styles and hover styles
const WorkOrderButton = ({ buttonText, buttonType }: WorkOrderButtonProps) => {
  return (
    <button
      className={`${buttonType === 'submit' ? classes.submit : classes.cancel}`}
    >
      {buttonText}
    </button>
  );
};

export default WorkOrderButton;

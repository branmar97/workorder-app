import classes from './ActionButton.module.css';

interface ActionButtonProps {
  buttonText: string;
  buttonType: 'primary' | 'danger';
  onClick?: Function;
}
// TODO: Add theme styles and hover styles, create better type definition for onClick

/**
 * Functional react component for displaying button
 *
 * @example
 * // Usage:
 * // <ActionButton buttonType='primary' buttonText='Submit' onClick={handleOnClick} />
 *
 * @param {ActionButtonProps} props - React props
 * @returns {JSX.Element} - Rendered ActionButton Component
 */
const ActionButton = ({
  buttonText,
  buttonType,
  onClick
}: ActionButtonProps) => {
  const handleOnClick = () => {
    if (onClick) {
      onClick();
    }
  };
  return (
    <button
      className={`${classes['action-button']} ${classes[buttonType]}`}
      onClick={handleOnClick}
    >
      {buttonText}
    </button>
  );
};

export default ActionButton;

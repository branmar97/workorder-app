import type { Dispatch, ReactNode, SetStateAction } from 'react';
import ActionButton from './ui/ActionButton';
import classes from '@/components/WorkOrderModal.module.css';

interface WorkOrderModalProps {
  children: ReactNode;
  toggleModal: Dispatch<SetStateAction<boolean>>;
}
// TODO: Add theme styles

/**
 * Functional react component for displaying modal
 *
 * @example
 * // Usage:
 * // {open && (
            <WorkOrderModal toggleModal={setOpen}>
              <div>Modal Content</div>
            </WorkOrderModal>
          )}
 *
 * @param {WorkOrderModalProps} props - React props
 * @returns {JSX.Element} - Rendered WorkOrderModal Component
 */
const WorkOrderModal = ({ toggleModal, children }: WorkOrderModalProps) => {
  const handleOnClick = () => {
    toggleModal(false);
  };
  return (
    <>
      <div className={classes.backdrop} onClick={handleOnClick} />
      <div className={classes['workorder-modal']}>
        <div className={classes['modal-content']}>{children}</div>
        <footer className={classes.actions}>
          <ActionButton
            buttonType='primary'
            buttonText='Close'
            onClick={handleOnClick}
          />
        </footer>
      </div>
    </>
  );
};

export default WorkOrderModal;

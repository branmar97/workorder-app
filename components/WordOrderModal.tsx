import type { Dispatch, ReactNode, SetStateAction } from 'react';
import WorkOrderButton from './ui/WorkOrderButton';
import classes from '@/components/WordOrderModal.module.css';

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
  return (
    <>
      <div className={classes.backdrop} onClick={() => toggleModal(false)} />
      <div className={classes['workorder-modal']}>
        <div className={classes['modal-content']}>{children}</div>
        <footer className={classes.actions}>
          <WorkOrderButton
            buttonType='close'
            buttonText='Close'
            onClick={toggleModal}
          />
        </footer>
      </div>
    </>
  );
};

export default WorkOrderModal;

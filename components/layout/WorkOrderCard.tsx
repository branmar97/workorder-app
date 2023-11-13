import classes from '@/components/layout/WorkOrderCard.module.css';

interface WorkOrderCardProps {
  text: string;
}

// TODO: style card, add card content

/**
 * Functional react component for displaying card
 *
 * @example
 * // Usage:
 * // <WorkOrderCard text='Work Order Status: ' />
 *
 * @param {WorkOrderCardProps} props - React props
 * @returns {JSX.Element} - Rendered WorkOrderCard Component
 */
const WorkOrderCard = ({ text }: WorkOrderCardProps) => {
  return <div className={classes['workorder-card']}>{text}</div>;
};

export default WorkOrderCard;

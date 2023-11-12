import '@testing-library/jest-dom';
import { render, screen } from '@testing-library/react';
import Home from '../app/page';

describe('Home', () => {
  it('renders the Homepage', () => {
    render(<Home />);
    // check if all components are rendered
    expect(screen.getByTestId('test-jest')).toBeInTheDocument();
  });
});

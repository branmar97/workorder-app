import { gql } from '@urql/next';

export default gql`
  query GetClients {
    client {
      client_id
      name
    }
  }
`;

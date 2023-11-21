import { gql } from '@urql/next';

export default gql`
  query getClients {
    client {
      client_id
      name
    }
  }
`;

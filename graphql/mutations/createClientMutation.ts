import { gql } from '@urql/next';

export default gql`
  mutation CreateClientMutation($input: client_insert_input!) {
    insert_client_one(object: $input) {
      client_id
      name
    }
  }
`;

import {
  Client,
  ClientOptions,
  
  cacheExchange,
  createClient,
  fetchExchange,
  ssrExchange
} from 'urql/core';

const isServerSide = typeof window === 'undefined';

const url = 'http://localhost:8080/v1/graphql';

const clientOptions = (isServerSide: boolean): ClientOptions => {
  const optionsObj: ClientOptions = {
    exchanges: [cacheExchange, fetchExchange],
    fetchOptions: {
      headers: {
        'x-hasura-admin-secret': 'myadminsecretkey'
      }
    },
    requestPolicy: 'cache-and-network',
    url
  };
  if (isServerSide) {
    return optionsObj;
  }
  const ssr = ssrExchange();
  optionsObj.exchanges.push(ssr);
  optionsObj.suspense = true;
  return optionsObj;
};

let urqlClient: Client = createClient(clientOptions(isServerSide));

export default urqlClient;

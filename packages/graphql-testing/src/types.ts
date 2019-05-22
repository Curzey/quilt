import {DocumentNode} from 'graphql';
import {GraphQLRequest, Operation} from 'apollo-link';

export interface FindOptions {
  query?: DocumentNode | {resolved?: DocumentNode};
  mutation?: DocumentNode;

  /**
   * @deprecated Please use `query` or `mutation` instead.
   */
  operationName?: string;
}

export type MockGraphQLResponse = Error | object;
export type MockGraphQLFunction = (
  request: GraphQLRequest,
) => MockGraphQLResponse;
export type GraphQLMock =
  | {[key: string]: MockGraphQLResponse | MockGraphQLFunction}
  | MockGraphQLFunction;

export interface MockRequest {
  operation: Operation;
  resolve(): Promise<void>;
}

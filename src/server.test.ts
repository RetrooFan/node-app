import test from 'node:test';
import assert from 'node:assert/strict';
import request from 'supertest';

import { app } from './server.js';

test('GET / returns Hello, World!', async () => {
  const response = await request(app).get('/');

  assert.equal(response.status, 200);
  assert.equal(response.text, 'Hello, test World!');
});

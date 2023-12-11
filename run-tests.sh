#!/bin/bash

(cd lua/ && for filename in 'randomness/test/*.lua'; do lua ${filename}; done)

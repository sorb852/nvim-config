local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s('COMP', {
    t {
      '#include <bits/stdc++.h>',
      '#define ll long long int',
      '#define isEven(n) ((n & 1) == 0)',
      '',
      'using namespace std;',
      '',
      'void solve() {',
      '  ',
    },
    i(1),
    t {
      '',
      '}',
      '',
      'int main() {',
      '  ios::sync_with_stdio(0);',
      '  cin.tie(0);',
      '  freopen("input.txt", "r", stdin);',
      '',
      '  int tc;',
      '  cin >> tc;',
      '',
      '  while (tc--) {',
      '    solve();',
      '  }',
      '',
      '  return 0;',
      '}',
    },
  }),
}

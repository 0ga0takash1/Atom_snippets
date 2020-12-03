#include <bits/stdc++.h>
using namespace std;

typedef std::vector<std::vector<int64_t> > Graph;

#define rep(i, n) for (int64_t i = 0; i < n; ++i)
#define rep2(i, n) for (int64_t i = 1; i <= n; ++i)
#define repb(i, l, n) for (int64_t i = l; i < n; ++i)
#define repb2(i, l, n) for (int64_t i = l; i <= n; ++i)
#define repe(a, b) for (auto&(a) : (b))
#define ALL(v) (v).begin(), (v).end()
#define Sort(x) sort(ALL(x))
#define Sort_rev(x) Sort(x);reverse(ALL(x))
#define mp(a, b) make_pair((a), (b))
#define Push_back(a, b) push_back( mp( (a), (b) ) )
#define ctoi(c) (c)-'0'

template<class T>bool chmax(T &a, const T &b) { if (a<b) { a=b; return 1;  } return 0;  }
template<class T>bool chmin(T &a, const T &b) { if (b<a) { a=b; return 1;  } return 0;  }
template<typename V,typename T> bool find_num(V v, T num) { if ( find(ALL(v), num) == v.end() ) { return false; } return true; }

const int inf = 0x3fffffff;
const int64_t INF = 0x3fffffffffffffff;
const int64_t MOD = 1e9+7;

int64_t gcd(int64_t a, int64_t b) {
    return b ? gcd(b, a%b) : a;
}

int64_t extend_gcd(int64_t a, int64_t b, int64_t &x, int64_t &y) {
    if (b == 0) {
        x = 1;
        y = 0;
        return a;
    } else {
        int64_t d = extend_gcd(b, a % b, y, x);
        y -= a / b * x;
        return d;
    }
}

bool isPrime(int64_t x) {
    int i;
    if(x < 2)return 0;
    else if(x == 2) return 1;
    if(x%2 == 0) return 0;
    for(i = 3; i*i <= x; i += 2) if(x%i == 0) return 0;
    return 1;
}

vector<pair<int64_t, int64_t> > prime_factorize(int64_t N) {
    vector<pair<int64_t, int64_t> > res;
    for (int64_t a = 2; a * a <= N; ++a) {
        if (N % a != 0) continue;
        int64_t ex = 0;

        while (N % a == 0) {
            ++ex;
            N /= a;
        }

        res.push_back({a, ex});
    }

    if (N != 1) res.push_back({N, 1});
    rep(i, res.size()) cout << "{" << res[i].first << ", " << res[i].second << "}, ";
    cout << endl;
    return res;
}

int main() {
    /*
    問1
    int64_t a = 26001, b = 800...; //学籍番号
    prime_factorize(a);
    prime_factorize(b);
    */

    /*
    問2
    int64_t u, v;
    extend_gcd(b, a, u, v);
    cout << u << " " << v << endl;

    while (1) {
        cout << a << " = " << a/b << "*" << b << "+" << a%b << endl;
        if (a%b == 0) break;
        int64_t temp = a%b;
        a = b;
        b = temp;
    }
    */

    /*
    問5
    int64_t mod = 53629;
    cout << (a%mod) << " " << (b%mod) << endl;
    int64_t ans5 = (a%mod)*(b%mod);
    cout << ans5%mod << endl;
    */

    /*
    問6
    int64_t phi10 = 4;
    cout << b << " = " << b/phi10 << "*" << phi10 << "+" << b%phi10 << endl;
    */
    return 0;
}

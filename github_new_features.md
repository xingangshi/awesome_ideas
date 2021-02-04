# github .md  files new features

## 1. 支持部分内容折叠起来 `details`

```javascript
function a(x) {
  x++;
  return function () {
    console.log(++x);
  };
}

a(1)();a(1)();a(1)();

let x = a(1);
x();x();x();
```
- A: `1, 2, 3` and `1, 2, 3`
- B: `3, 3, 3` and `3, 4, 5`
- C: `3, 3, 3` and `1, 2, 3`
- D: `1, 2, 3` and `3, 3, 3`

<details><summary><b>Answer</b></summary>
<p>

#### Answer: B

</p>
</details>


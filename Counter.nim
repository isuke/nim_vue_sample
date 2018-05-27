type VueData = object
  title: cstring
  count: cint

type VueComponent = object
  name: cstring
  `template`: cstring
  props: seq[cstring]
  data: proc (): VueData
  methods: seq[proc (): void]

proc data(): VueData =
  VueData(title: "This is Counter", count: 0)

let Counter {.exportc.} = VueComponent(
  name: "Counter",
  `template`: """
    <div class="counter">
      <h3>{{ title }}</h3>
      <h4>{{ message }}</h4>
      <button @click="count += 1">Click Here</button>
      <p>count: {{count}}</p>
    </div>
  """,
  props: @["message".cstring],
  data: data, # 無名プロシージャーでの書き方がわからなかった。
)

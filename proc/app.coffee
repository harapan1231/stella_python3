app = {}

app.view = () ->
  m("div", {class: "uk-container"}, [
    m("h2", {class: "uk-h2"}, "Stella"),
    m("h5", {class: "uk-h5"}, "-- Lingo Rings --"),
    m("img", {class: "", src: "/img/loading.png"}),
    m("div", {class: "uk-grid"}, [
      m("input", {type: "text", class: "uk-width-2-4", oninput: m.withAttr("value", app.vm.in),onchange: app.vm.translate, value: app.vm.in()}),
    ]),
    m("div", {class: "uk-grid"}, [
      m("select", {id: "from_lang", class: "uk-width-1-4", onchange: app.vm.translate}, app.vm.langs.map((obj, i) ->
        return m("option", {value: obj.value}, obj.caption);
      )),
      m("span", {class: "uk-width-3-4"}, app.vm.in()),
    ]),
    m("div", {class: "uk-grid"}, [
      m("select", {id: "to_lang", class: "uk-width-1-4", onchange: app.vm.translate}, app.vm.langs.map((obj, i) ->
        return m("option", {value: obj.value}, obj.caption);
      )),
      m("span", {class: "uk-width-3-4"}, app.vm.out()),
    ]),
  ])

app.vm = (
  vm = {}
  vm.init = () ->
    vm.in = m.prop("")
    vm.out = m.prop("")
    vm.translate = (params) ->
      if vm.in() and $("#from_lang").val() != $("#to_lang").val()
        m.request({
          method: "get",
          url: "/api/" + $("#from_lang").val() + "/" + $("#to_lang").val() + "/" + vm.in()
        }).then((ret) ->
          vm.out(ret)
          return
        )
      return
    vm.langs = [
      {value: "af", caption: "Afrikaans"},
      {value: "sq", caption: "Albanian"},
      {value: "ar", caption: "Arabic"},
      {value: "az", caption: "Azerbaijani"},
      {value: "eu", caption: "Basque"},
      {value: "be", caption: "Belarusian"},
      {value: "bn", caption: "Bengali"},
      {value: "bg", caption: "Bulgarian"},
      {value: "ca", caption: "Catalan"},
      {value: "zh_CN", caption: "Chinese (Simplified)"},
      {value: "zh_TW", caption: "Chinese (Traditional)"},
      {value: "hr", caption: "Croatian"},
      {value: "cs", caption: "Czech"},
      {value: "da", caption: "Danish"},
      {value: "nl", caption: "Dutch"},
      {value: "en", caption: "English"},
      {value: "eo", caption: "Esperanto"},
      {value: "et", caption: "Estonian"},
      {value: "fa", caption: "Farsi"},
      {value: "tl", caption: "Filipino"},
      {value: "fi", caption: "Finnish"},
      {value: "fr", caption: "French"},
      {value: "gl", caption: "Galician"},
      {value: "ka", caption: "Georgian"},
      {value: "de", caption: "German"},
      {value: "el", caption: "Greek"},
      {value: "gu", caption: "Gujarati"},
      {value: "ht", caption: "Haitian Creole"},
      {value: "ha", caption: "Hausa"},
      {value: "he", caption: "Hebrew"},
      {value: "hi", caption: "Hindi"},
      {value: "hu", caption: "Hungarian"},
      {value: "is", caption: "Icelandic"},
      {value: "id", caption: "Indonesian"},
      {value: "ga", caption: "Irish"},
      {value: "it", caption: "Italian"},
      {value: "ja", caption: "日本語"},
      {value: "kn", caption: "Kannada"},
      {value: "ko", caption: "Korean"},
      {value: "la", caption: "Latin"},
      {value: "lv", caption: "Latvian"},
      {value: "lt", caption: "Lithuanian"},
      {value: "mk", caption: "Macedonian"},
      {value: "ms", caption: "Malay"},
      {value: "mt", caption: "Maltese"},
      {value: "no", caption: "Norwegian"},
      {value: "pl", caption: "Polish"},
      {value: "pt", caption: "Portuguese"},
      {value: "ro", caption: "Romanian"},
      {value: "ru", caption: "Russian"},
      {value: "sr", caption: "Serbian"},
      {value: "sk", caption: "Slovak"},
      {value: "sl", caption: "Slovenian"},
      {value: "so", caption: "Somali"},
      {value: "es", caption: "Spanish"},
      {value: "sw", caption: "Swahili"},
      {value: "sv", caption: "Swedish"},
      {value: "ta", caption: "Tamil"},
      {value: "te", caption: "Telugu"},
      {value: "th", caption: "Thai"},
      {value: "tr", caption: "Turkish"},
      {value: "uk", caption: "Ukrainian"},
      {value: "ur", caption: "Urdu"},
      {value: "vi", caption: "Vietnamese"},
      {value: "cy", caption: "Welsh"},
      {value: "yi", caption: "Yiddish"},
    ]
    return
  vm
)

app.controller = () ->
  app.vm.init()
  return

m.mount(document.body, {controller: app.controller, view: app.view, config: app.config})

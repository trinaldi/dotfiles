# Autocomplete BG fix
Reline.core.add_dialog_proc(
  :autocomplete,
  lambda {
    instance_exec(&Reline::DEFAULT_DIALOG_PROC_AUTOCOMPLETE).tap do
      _1&.bg_color = 1
    end
  },
  Reline::DEFAULT_DIALOG_CONTEXT
)

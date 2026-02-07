# Home assistant add-on: Trilium Notes
Trilium Next Notes is a hierarchical note taking application with focus on building large personal knowledge bases. 

## Installation

1. Add my [Home Assistant add-ons repository][repository] to your Home Assistant apps.
2. Install this add-on/app.
3. Start the add-on, it will fail.
4. Then ssh to your home assistant and run `chmod 777 /addon_configs/2b36e01f_triliumnext`
5. Start the add-on.
6. Go to your local homeassistant IP:port admin port or ingress.

```
port : 8000 #port you want to run admin interface on.
```

Webui can be found at `<your-ip>:port` or ingress.

[repository]: https://github.com/jsittner/homeassistant-addons

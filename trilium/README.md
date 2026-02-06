# Home assistant add-on: Trilium Notes
Trilium Next Notes is a hierarchical note taking application with focus on building large personal knowledge bases. 

## Installation

1. [Add my Hass.io add-ons repository][repository] to your Hass.io instance.
2. Install this add-on.
3. Click the `Save` button to store your configuration.
4. Start the add-on, it will fail.
5. Then ssh to your home assistant and run `chmod 777 /addon_configs/2b36e01f_triliumnext`
6. Start the add-on.
7. Go to your local homeassistant IP:port admin port or ingress.

```
port : 8000 #port you want to run admin interface on.
```

Webui can be found at `<your-ip>:port` or ingress.

[repository]: https://github.com/jsittner/homeassistant-addons

# Home assistant add-on: Trillium Next Notes
Trilium Next Notes is a hierarchical note taking application with focus on building large personal knowledge bases. 

## Installation

1. [Add my Hass.io add-ons repository][repository] to your Hass.io instance.
1. Install this add-on.
1. Click the `Save` button to store your configuration.
1. Start the add-on, it will fail.
1. Then ssh to your home assistant and run `chmod 777 /addon_configs/2b36e01f_triliumnext`
1. Start the add-on.
1. Check the logs of the add-on to see if everything went well.
1. Go to your local homeassistant IP:port admin port or ingress.
1. Follow directions

```
port : 8000 #port you want to run admin interface on.
```

Webui can be found at `<your-ip>:port` or ingress.

[repository]: https://github.com/jsittner/homeassistant-addons


#4

from config import settings
from pathlib import Path

CONFIG_TEMPLATE = f"""
[config]
IbLoginId={settings.ib_user}
IbPassword={settings.ib_password}
TradingMode={settings.ib_mode}
IbDir=/root/Jts
Mode=gateway
TwsSettingsPath=/root/Jts
GatewayScript=/root/Jts/ibgateway/ibgateway
ReadOnlyApi=false
"""

def generate_config():
    config_path = Path("ibc/resources/config.ini")
    config_path.parent.mkdir(parents=True, exist_ok=True)
    config_path.write_text(CONFIG_TEMPLATE.strip())
    print(f"[✔] Generated {config_path}")

if __name__ == "__main__":
    generate_config()

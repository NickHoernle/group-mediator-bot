from slackclient import SlackClient
slack_client = SlackClient('xoxb-165832390384-z8dOBLAQgBtZLnl3xMr6eErD')
slack_client.api_call("api.test")


def list_channels():
    channels_call = slack_client.api_call("channels.list")
    if channels_call.get('ok'):
        return channels_call['channels']
    return None

if __name__ == '__main__':
    channels = list_channels()
    if channels:
        print("Channels: ")
        for c in channels:
            print(c['name'] + " (" + c['id'] + ")")
    else:
        print("Unable to authenticate.")

# WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
# See https://github.com/aws-beam/aws-codegen for more details.

defmodule AWS.Ivs do
  @moduledoc """
  **Introduction**

  The Amazon Interactive Video Service (IVS) API is REST compatible, using a
  standard HTTP API and an [AWS SNS](http://aws.amazon.com/sns) event stream
  for responses. JSON is used for both requests and responses, including
  errors.

  The API is an AWS regional service, currently in these regions: us-west-2,
  us-east-1, and eu-west-1.

  * **All API request parameters and URLs are case sensitive. ** *

  For a summary of notable documentation changes in each release, see [
  Document
  History](https://docs.aws.amazon.com/ivs/latest/userguide/doc-history.html).

  **Service Endpoints**

  The following are the Amazon IVS service endpoints (all HTTPS):

  Region name: US West (Oregon)

  <ul> <li> Region: `us-west-2`

  </li> <li> Endpoint: `ivs.us-west-2.amazonaws.com`

  </li> </ul> Region name: US East (Virginia)

  <ul> <li> Region: `us-east-1`

  </li> <li> Endpoint: `ivs.us-east-1.amazonaws.com`

  </li> </ul> Region name: EU West (Dublin)

  <ul> <li> Region: `eu-west-1`

  </li> <li> Endpoint: `ivs.eu-west-1.amazonaws.com`

  </li> </ul> **Allowed Header Values**

  <ul> <li> ` **Accept:** ` application/json

  </li> <li> ` **Accept-Encoding:** ` gzip, deflate

  </li> <li> ` **Content-Type:** `application/json

  </li> </ul> **Resources**

  The following resources contain information about your IVS live stream (see
  [ Getting Started with Amazon
  IVS](https://docs.aws.amazon.com/ivs/latest/userguide/GSIVS.html)):

  <ul> <li> Channel — Stores configuration data related to your live stream.
  You first create a channel and then use the channel’s stream key to start
  your live stream. See the Channel endpoints for more information.

  </li> <li> Stream key — An identifier assigned by Amazon IVS when you
  create a channel, which is then used to authorize streaming. See the
  StreamKey endpoints for more information. * **Treat the stream key like a
  secret, since it allows anyone to stream to the channel.** *

  </li> <li> Playback key pair — Video playback may be restricted using
  playback-authorization tokens, which use public-key encryption. A playback
  key pair is the public-private pair of keys used to sign and validate the
  playback-authorization token. See the PlaybackKeyPair endpoints for more
  information.

  </li> </ul> **Tagging**

  A *tag* is a metadata label that you assign to an AWS resource. A tag
  comprises a *key* and a *value*, both set by you. For example, you might
  set a tag as `topic:nature` to label a particular video category. See
  [Tagging AWS
  Resources](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html)
  for more information, including restrictions that apply to tags.

  Tags can help you identify and organize your AWS resources. For example,
  you can use the same tag for different resources to indicate that they are
  related. You can also use tags to manage access (see [ Access
  Tags](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html)).

  The Amazon IVS API has these tag-related endpoints: `TagResource`,
  `UntagResource`, and `ListTagsForResource`. The following resources support
  tagging: Channels, Stream Keys, and Playback Key Pairs.

  **Channel Endpoints**

  <ul> <li> `CreateChannel` — Creates a new channel and an associated stream
  key to start streaming.

  </li> <li> `GetChannel` — Gets the channel configuration for the specified
  channel ARN (Amazon Resource Name).

  </li> <li> `BatchGetChannel` — Performs `GetChannel` on multiple ARNs
  simultaneously.

  </li> <li> `ListChannels` — Gets summary information about all channels in
  your account, in the AWS region where the API request is processed. This
  list can be filtered to match a specified string.

  </li> <li> `UpdateChannel` — Updates a channel's configuration. This does
  not affect an ongoing stream of this channel. You must stop and restart the
  stream for the changes to take effect.

  </li> <li> `DeleteChannel` — Deletes the specified channel.

  </li> </ul> **StreamKey Endpoints**

  <ul> <li> `CreateStreamKey` — Creates a stream key, used to initiate a
  stream, for the specified channel ARN.

  </li> <li> `GetStreamKey` — Gets stream key information for the specified
  ARN.

  </li> <li> `BatchGetStreamKey` — Performs `GetStreamKey` on multiple ARNs
  simultaneously.

  </li> <li> `ListStreamKeys` — Gets summary information about stream keys
  for the specified channel.

  </li> <li> `DeleteStreamKey` — Deletes the stream key for the specified
  ARN, so it can no longer be used to stream.

  </li> </ul> **Stream Endpoints**

  <ul> <li> `GetStream` — Gets information about the active (live) stream on
  a specified channel.

  </li> <li> `ListStreams` — Gets summary information about live streams in
  your account, in the AWS region where the API request is processed.

  </li> <li> `StopStream` — Disconnects the incoming RTMPS stream for the
  specified channel. Can be used in conjunction with `DeleteStreamKey` to
  prevent further streaming to a channel.

  </li> <li> `PutMetadata` — Inserts metadata into an RTMPS stream for the
  specified channel. A maximum of 5 requests per second per channel is
  allowed, each with a maximum 1KB payload.

  </li> </ul> **PlaybackKeyPair Endpoints**

  <ul> <li> `ImportPlaybackKeyPair` — Imports the public portion of a new key
  pair and returns its `arn` and `fingerprint`. The `privateKey` can then be
  used to generate viewer authorization tokens, to grant viewers access to
  authorized channels.

  </li> <li> `GetPlaybackKeyPair` — Gets a specified playback authorization
  key pair and returns the `arn` and `fingerprint`. The `privateKey` held by
  the caller can be used to generate viewer authorization tokens, to grant
  viewers access to authorized channels.

  </li> <li> `ListPlaybackKeyPairs` — Gets summary information about playback
  key pairs.

  </li> <li> `DeletePlaybackKeyPair` — Deletes a specified authorization key
  pair. This invalidates future viewer tokens generated using the key pair’s
  `privateKey`.

  </li> </ul> **AWS Tags Endpoints**

  <ul> <li> `TagResource` — Adds or updates tags for the AWS resource with
  the specified ARN.

  </li> <li> `UntagResource` — Removes tags from the resource with the
  specified ARN.

  </li> <li> `ListTagsForResource` — Gets information about AWS tags for the
  specified ARN.

  </li> </ul>
  """

  @doc """
  Performs `GetChannel` on multiple ARNs simultaneously.
  """
  def batch_get_channel(client, input, options \\ []) do
    path_ = "/BatchGetChannel"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, nil)
  end

  @doc """
  Performs `GetStreamKey` on multiple ARNs simultaneously.
  """
  def batch_get_stream_key(client, input, options \\ []) do
    path_ = "/BatchGetStreamKey"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, nil)
  end

  @doc """
  Creates a new channel and an associated stream key to start streaming.
  """
  def create_channel(client, input, options \\ []) do
    path_ = "/CreateChannel"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, nil)
  end

  @doc """
  Creates a stream key, used to initiate a stream, for the specified channel
  ARN.

  Note that `CreateChannel` creates a stream key. If you subsequently use
  CreateStreamKey on the same channel, it will fail because a stream key
  already exists and there is a limit of 1 stream key per channel. To reset
  the stream key on a channel, use `DeleteStreamKey` and then
  CreateStreamKey.
  """
  def create_stream_key(client, input, options \\ []) do
    path_ = "/CreateStreamKey"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, nil)
  end

  @doc """
  Deletes the specified channel and its associated stream keys.
  """
  def delete_channel(client, input, options \\ []) do
    path_ = "/DeleteChannel"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, nil)
  end

  @doc """
  Deletes a specified authorization key pair. This invalidates future viewer
  tokens generated using the key pair’s `privateKey`.
  """
  def delete_playback_key_pair(client, input, options \\ []) do
    path_ = "/DeletePlaybackKeyPair"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, nil)
  end

  @doc """
  Deletes the stream key for the specified ARN, so it can no longer be used
  to stream.
  """
  def delete_stream_key(client, input, options \\ []) do
    path_ = "/DeleteStreamKey"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, nil)
  end

  @doc """
  Gets the channel configuration for the specified channel ARN. See also
  `BatchGetChannel`.
  """
  def get_channel(client, input, options \\ []) do
    path_ = "/GetChannel"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, nil)
  end

  @doc """
  Gets a specified playback authorization key pair and returns the `arn` and
  `fingerprint`. The `privateKey` held by the caller can be used to generate
  viewer authorization tokens, to grant viewers access to authorized
  channels.
  """
  def get_playback_key_pair(client, input, options \\ []) do
    path_ = "/GetPlaybackKeyPair"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, nil)
  end

  @doc """
  Gets information about the active (live) stream on a specified channel.
  """
  def get_stream(client, input, options \\ []) do
    path_ = "/GetStream"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, nil)
  end

  @doc """
  Gets stream-key information for a specified ARN.
  """
  def get_stream_key(client, input, options \\ []) do
    path_ = "/GetStreamKey"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, nil)
  end

  @doc """
  Imports the public portion of a new key pair and returns its `arn` and
  `fingerprint`. The `privateKey` can then be used to generate viewer
  authorization tokens, to grant viewers access to authorized channels.
  """
  def import_playback_key_pair(client, input, options \\ []) do
    path_ = "/ImportPlaybackKeyPair"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, nil)
  end

  @doc """
  Gets summary information about all channels in your account, in the AWS
  region where the API request is processed. This list can be filtered to
  match a specified string.
  """
  def list_channels(client, input, options \\ []) do
    path_ = "/ListChannels"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, nil)
  end

  @doc """
  Gets summary information about playback key pairs.
  """
  def list_playback_key_pairs(client, input, options \\ []) do
    path_ = "/ListPlaybackKeyPairs"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, nil)
  end

  @doc """
  Gets summary information about stream keys for the specified channel.
  """
  def list_stream_keys(client, input, options \\ []) do
    path_ = "/ListStreamKeys"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, nil)
  end

  @doc """
  Gets summary information about live streams in your account, in the AWS
  region where the API request is processed.
  """
  def list_streams(client, input, options \\ []) do
    path_ = "/ListStreams"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, nil)
  end

  @doc """
  Gets information about AWS tags for the specified ARN.
  """
  def list_tags_for_resource(client, resource_arn, options \\ []) do
    path_ = "/tags/#{URI.encode(resource_arn)}"
    headers = []
    query_ = []
    request(client, :get, path_, query_, headers, nil, options, nil)
  end

  @doc """
  Inserts metadata into an RTMPS stream for the specified channel. A maximum
  of 5 requests per second per channel is allowed, each with a maximum 1KB
  payload.
  """
  def put_metadata(client, input, options \\ []) do
    path_ = "/PutMetadata"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, nil)
  end

  @doc """
  Disconnects the incoming RTMPS stream for the specified channel. Can be
  used in conjunction with `DeleteStreamKey` to prevent further streaming to
  a channel.

  <note> Many streaming client-software libraries automatically reconnect a
  dropped RTMPS session, so to stop the stream permanently, you may want to
  first revoke the `streamKey` attached to the channel.

  </note>
  """
  def stop_stream(client, input, options \\ []) do
    path_ = "/StopStream"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, nil)
  end

  @doc """
  Adds or updates tags for the AWS resource with the specified ARN.
  """
  def tag_resource(client, resource_arn, input, options \\ []) do
    path_ = "/tags/#{URI.encode(resource_arn)}"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, nil)
  end

  @doc """
  Removes tags from the resource with the specified ARN.
  """
  def untag_resource(client, resource_arn, input, options \\ []) do
    path_ = "/tags/#{URI.encode(resource_arn)}"
    headers = []
    {query_, input} =
      [
        {"tagKeys", "tagKeys"},
      ]
      |> AWS.Request.build_params(input)
    request(client, :delete, path_, query_, headers, input, options, nil)
  end

  @doc """
  Updates a channel's configuration. This does not affect an ongoing stream
  of this channel. You must stop and restart the stream for the changes to
  take effect.
  """
  def update_channel(client, input, options \\ []) do
    path_ = "/UpdateChannel"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, nil)
  end

  @spec request(AWS.Client.t(), binary(), binary(), list(), list(), map(), list(), pos_integer()) ::
          {:ok, map() | nil, map()}
          | {:error, term()}
  defp request(client, method, path, query, headers, input, options, success_status_code) do
    client = %{client | service: "ivs"}
    host = build_host("ivs", client)
    url = host
    |> build_url(path, client)
    |> add_query(query, client)

    additional_headers = [{"Host", host}, {"Content-Type", "application/x-amz-json-1.1"}]
    headers = AWS.Request.add_headers(additional_headers, headers)

    payload = encode!(client, input)
    headers = AWS.Request.sign_v4(client, method, url, headers, payload)
    perform_request(client, method, url, payload, headers, options, success_status_code)
  end

  defp perform_request(client, method, url, payload, headers, options, success_status_code) do
    case AWS.Client.request(client, method, url, payload, headers, options) do
      {:ok, %{status_code: status_code, body: body} = response}
      when is_nil(success_status_code) and status_code in [200, 202, 204]
      when status_code == success_status_code ->
        body = if(body != "", do: decode!(client, body))
        {:ok, body, response}

      {:ok, response} ->
        {:error, {:unexpected_response, response}}

      error = {:error, _reason} -> error
    end
  end


  defp build_host(_endpoint_prefix, %{region: "local", endpoint: endpoint}) do
    endpoint
  end
  defp build_host(_endpoint_prefix, %{region: "local"}) do
    "localhost"
  end
  defp build_host(endpoint_prefix, %{region: region, endpoint: endpoint}) do
    "#{endpoint_prefix}.#{region}.#{endpoint}"
  end

  defp build_url(host, path, %{:proto => proto, :port => port}) do
    "#{proto}://#{host}:#{port}#{path}"
  end

  defp add_query(url, [], _client) do
    url
  end
  defp add_query(url, query, client) do
    querystring = encode!(client, query, :query)
    "#{url}?#{querystring}"
  end

  defp encode!(client, payload, format \\ :json) do
    AWS.Client.encode!(client, payload, format)
  end

  defp decode!(client, payload) do
    AWS.Client.decode!(client, payload, :json)
  end
end

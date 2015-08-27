# WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
# See https://github.com/jkakar/aws-codegen for more details.

defmodule AWS.Workspaces do
  @moduledoc """
  Amazon WorkSpaces Service

  This is the *Amazon WorkSpaces API Reference*. This guide provides detailed
  information about Amazon WorkSpaces operations, data types, parameters, and
  errors.
  """

  @doc """
  Creates one or more WorkSpaces.

  <note> This operation is asynchronous and returns before the WorkSpaces are
  created.

  </note>
  """
  def create_workspaces(client, input, http_options \\ []) do
    request(client, "CreateWorkspaces", input, http_options)
  end

  @doc """
  Obtains information about the WorkSpace bundles that are available to your
  account in the specified region.

  You can filter the results with either the `BundleIds` parameter, or the
  `Owner` parameter, but not both.

  This operation supports pagination with the use of the `NextToken` request
  and response parameters. If more results are available, the `NextToken`
  response member contains a token that you pass in the next call to this
  operation to retrieve the next set of items.
  """
  def describe_workspace_bundles(client, input, http_options \\ []) do
    request(client, "DescribeWorkspaceBundles", input, http_options)
  end

  @doc """
  Retrieves information about the AWS Directory Service directories in the
  region that are registered with Amazon WorkSpaces and are available to your
  account.

  This operation supports pagination with the use of the `NextToken` request
  and response parameters. If more results are available, the `NextToken`
  response member contains a token that you pass in the next call to this
  operation to retrieve the next set of items.
  """
  def describe_workspace_directories(client, input, http_options \\ []) do
    request(client, "DescribeWorkspaceDirectories", input, http_options)
  end

  @doc """
  Obtains information about the specified WorkSpaces.

  Only one of the filter parameters, such as `BundleId`, `DirectoryId`, or
  `WorkspaceIds`, can be specified at a time.

  This operation supports pagination with the use of the `NextToken` request
  and response parameters. If more results are available, the `NextToken`
  response member contains a token that you pass in the next call to this
  operation to retrieve the next set of items.
  """
  def describe_workspaces(client, input, http_options \\ []) do
    request(client, "DescribeWorkspaces", input, http_options)
  end

  @doc """
  Reboots the specified WorkSpaces.

  To be able to reboot a WorkSpace, the WorkSpace must have a **State** of
  `AVAILABLE`, `IMPAIRED`, or `INOPERABLE`.

  <note> This operation is asynchronous and will return before the WorkSpaces
  have rebooted.

  </note>
  """
  def reboot_workspaces(client, input, http_options \\ []) do
    request(client, "RebootWorkspaces", input, http_options)
  end

  @doc """
  Rebuilds the specified WorkSpaces.

  Rebuilding a WorkSpace is a potentially destructive action that can result
  in the loss of data. Rebuilding a WorkSpace causes the following to occur:

  <ul> <li>The system is restored to the image of the bundle that the
  WorkSpace is created from. Any applications that have been installed, or
  system settings that have been made since the WorkSpace was created will be
  lost.</li> <li>The data drive (D drive) is re-created from the last
  automatic snapshot taken of the data drive. The current contents of the
  data drive are overwritten. Automatic snapshots of the data drive are taken
  every 12 hours, so the snapshot can be as much as 12 hours old.</li> </ul>
  To be able to rebuild a WorkSpace, the WorkSpace must have a **State** of
  `AVAILABLE` or `ERROR`.

  <note> This operation is asynchronous and will return before the WorkSpaces
  have been completely rebuilt.

  </note>
  """
  def rebuild_workspaces(client, input, http_options \\ []) do
    request(client, "RebuildWorkspaces", input, http_options)
  end

  @doc """
  Terminates the specified WorkSpaces.

  Terminating a WorkSpace is a permanent action and cannot be undone. The
  user's data is not maintained and will be destroyed. If you need to archive
  any user data, contact Amazon Web Services before terminating the
  WorkSpace.

  You can terminate a WorkSpace that is in any state except `SUSPENDED`.

  <note> This operation is asynchronous and will return before the WorkSpaces
  have been completely terminated.

  </note>
  """
  def terminate_workspaces(client, input, http_options \\ []) do
    request(client, "TerminateWorkspaces", input, http_options)
  end

  defp request(client, action, input, http_options) do
    client = %{client | service: "workspaces"}
    host = "workspaces.#{client.region}.#{client.endpoint}"
    url = "https://#{host}/"
    headers = [{"Host", host},
               {"Content-Type", "application/x-amz-json-1.1"},
               {"X-Amz-Target", "WorkspacesService.#{action}"}]
    payload = Poison.Encoder.encode(input, [])
    headers = AWS.Request.sign_v4(client, "POST", url, headers, payload)
    case HTTPoison.post(url, payload, headers, http_options) do
      {:ok, response=%HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Poison.Parser.parse!(body), response}
      {:ok, response=%HTTPoison.Response{body: body}} ->
        reason = Poison.Parser.parse!(body)["__type"]
        {:error, reason, response}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, %HTTPoison.Error{reason: reason}}
    end
  end
end
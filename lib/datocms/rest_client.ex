defmodule DatoCMS.RESTClient do
  import JSONHyperschema.ClientBuilder

  @moduledoc """
  Create a REST client for DatoCMS from its JSON schema.
  """

  schema_path = "priv/schemas/site-api-hyperschema.json"
  {:ok, schema_json} = File.read(schema_path)

  defapi __MODULE__, :datocms_rest_client, schema_json

  def start(_start_type, _start_args) do
    HTTPoison.start()
    api_config =
      Application.get_env(:datocms_rest_client, :api_config, %{})
      |> put_in([:json_parser_options], [keys: :atoms])
    Application.put_env(:datocms_rest_client, :api_config, api_config)
    {:ok, self()}
  end
end

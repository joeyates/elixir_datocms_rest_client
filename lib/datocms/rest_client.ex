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
    {:ok, self()}
  end
end

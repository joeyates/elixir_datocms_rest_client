defmodule DatoCMS.RESTClient.Mixfile do
  use Mix.Project

  def project do
    [
      app: :datocms_rest_client,
      version: "0.6.1",
      elixir: "~> 1.4",
      name: "DatoCMS REST API client",
      description: "DatoCMS REST API client",
      package: package(),
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      elixirc_paths: elixirc_paths(Mix.env),
      source_url: "https://github.com/leanpanda-com/elixir_datocms_rest_client",
      homepage_url: "https://github.com/leanpanda-com/elixir_datocms_rest_client",
      docs: [
        main: "DatoCMS",
        extras: ["README.md", "DatoCMS-JSON-responses.md"]
      ],
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:httpoison, :logger],
      mod: {DatoCMS.RESTClient, []}
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:json_hyperschema_client_builder, "~> 0.12"},
      {:httpoison, "~> 1.6 and >= 1.6.2"}
    ]
  end

  defp package do
    %{
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/leanpanda-com/elixir_datocms_rest_client"
      },
      maintainers: ["Joe Yates"]
    }
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]
end

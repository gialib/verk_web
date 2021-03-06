defmodule VerkWeb.Mixfile do
  use Mix.Project

  @description """
    A Verk dashboard
  """

  def project do
    [
      app: :verk_web,
      version: "1.3.0",
      elixir: "~> 1.3",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: Coverex.Task, coveralls: true],
      name: "Verk Web",
      description: @description,
      package: package(),
      deps: deps()
    ]
  end

  @default_config [
    http: [port: 4000],
    server: false,
    pubsub: [
      name: VerkWeb.PubSub,
      adapter: Phoenix.PubSub.PG2
    ]
  ]

  def application do
    [
      mod: {VerkWeb, []},
      env: [{VerkWeb.Endpoint, @default_config}],
      applications: [
        :phoenix,
        :phoenix_pubsub,
        :phoenix_html,
        :cowboy,
        :logger,
        :gettext,
        :verk,
        :timex,
        :basic_auth
      ]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_), do: ["lib", "web"]

  defp deps do
    [
      {:phoenix_pubsub_redis, github: "phoenixframework/phoenix_pubsub_redis", override: true},
      {:phoenix, github: "phoenixframework/phoenix", override: true},
      {:phoenix_html, github: "phoenixframework/phoenix_html", override: true},
      {:phoenix_pubsub, github: "phoenixframework/phoenix_pubsub", override: true},
      {:phoenix_live_reload, github: "phoenixframework/phoenix_live_reload", only: :dev},

      {:gettext, "~> 0.9"},
      {:verk, "~> 1.1"},
      {:cowboy, "~> 1.0 or ~> 2.3"},
      {:basic_auth, "~> 2.0"},
      {:earmark, "~> 1.0", only: :dev},
      {:ex_doc, "~> 0.13", only: :dev},
      {:coverex, "~> 1.4", only: :test},
      {:meck, "~> 0.8", only: :test},
      {:timex, "~> 3.1.0"}
    ]
  end

  defp package do
    [
      maintainers: ["Eduardo Gurgel Pinho", "Alisson Sales"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/edgurgel/verk_web"},
      files: ["lib", "web", "priv", "mix.exs", "README*", "LICENSE*"]
    ]
  end
end

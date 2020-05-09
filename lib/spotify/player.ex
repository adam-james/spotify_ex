defmodule Spotify.Player do
  alias Spotify.Client
  use Spotify.Responder
  import Spotify.Helpers

  def play(conn) do
    conn |> Client.put(play_url([])) |> handle_response()
  end

  def play(conn, body \\ %{}, params \\ []) do
    conn |> Client.put(play_url(params), body) |> handle_response()
  end

  def play_url(params) do
    "https://api.spotify.com/v1/me/player/play" <> query_string(params)
  end

  def pause(conn) do
    conn |> Client.put(pause_url()) |> handle_response()
  end

  def pause_url do
    "https://api.spotify.com/v1/me/player/pause"
  end

  def build_response(body), do: body
end

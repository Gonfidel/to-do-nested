json.extract! board, :id, :name, :list, :created_at, :updated_at
json.url board_url(board, format: :json)

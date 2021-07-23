class_name RunAwayDucklingParams
extends DucklingParams


const RUN_AWAY_DUCKLING_PLAYER_SCENE := \
        preload("res://src/players/run_away_duckling/run_away_duckling.tscn")


# FIXME: ----------------- Pull these out into the in-scene MovementParams node.
func _init_params() -> void:
    ._init_params()
    
    in_air_horizontal_acceleration *= 2.0
    walk_acceleration *= 3.0
    
    max_horizontal_speed_default *= 2.0
    
    uses_duration_instead_of_distance_for_edge_weight = true
    additional_edge_weight_offset = 128.0
    walking_edge_weight_multiplier = 1.2
    climbing_edge_weight_multiplier = 1.8
    air_edge_weight_multiplier = 1.0

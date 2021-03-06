tool
class_name Fox
extends SurfacerCharacter
# This is a hazard that jumps at nearby ducklings, if momma isn't nearby.


var wander_controller: WanderBehavior
var collide_controller: CollideBehavior
var run_away_controller: RunAwayBehavior
var return_controller: ReturnBehavior


func _ready() -> void:
    if Engine.editor_hint:
        return
    wander_controller = get_behavior(WanderBehavior)
    collide_controller = get_behavior(CollideBehavior)
    run_away_controller = get_behavior(RunAwayBehavior)
    run_away_controller.move_target = Sc.level.momma
    return_controller = get_behavior(ReturnBehavior)


func _process_sounds() -> void:
    if just_triggered_jump:
        Sc.audio.play_sound("duck_jump")
    
    if surface_state.just_left_air:
        Sc.audio.play_sound("duck_land")


func _on_entered_proximity(
        target: Node2D,
        layer_names: Array) -> void:
    match layer_names[0]:
        "duckling":
            _on_duckling_entered_proximity(target)
        "momma":
            _run_from_momma()
        _:
            Sc.logger.error()


func _run_from_momma() -> void:
    _log("Fox run-from-momma start")
    run_away_controller.trigger(true)


func _on_duckling_entered_proximity(duckling: Duckling) -> void:
    _log("Fox is close to duckling")
    if run_away_controller.is_active or \
            collide_controller.is_active:
        return
    _pounce_on_duckling(duckling)


func _pounce_on_duckling(duckling: Duckling) -> void:
    _log("Fox pounce-on-duckling start")
    collide_controller.move_target = duckling
    collide_controller.trigger(true)


func on_touched_duckling(duckling: Duckling) -> void:
    _log("Fox collided with duckling")
    if collide_controller.is_active and \
            duckling == collide_controller.move_target:
        collide_controller.on_collided()


func on_touched_momma(momma: Momma) -> void:
    _log("Fox collided with momma")
    _run_from_momma()

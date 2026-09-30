extends Node3D
@onready var wallssss: Control = $"../Control/Walls"

var rays = [RayCast3D]
var walls = [ColorRect]

var shade = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	walls = wallssss.get_children()
	rays = self.get_children()
	
	for ray : RayCast3D in rays:
		
		if ray.is_colliding():
			var wall : ColorRect
			for w : ColorRect in walls:
				if w.get_index() == ray.get_index():
					wall = w
					print("aaa")
					break
			var dist = global_position.distance_to(ray.get_collision_point())
			wall.modulate = Color8(255-(dist*shade),255-(dist*shade),255-(dist*shade), 255)
			wall.scale.y = 1-(dist/32)
			wall.scale.y = clampf(wall.scale.y, 0, 648)

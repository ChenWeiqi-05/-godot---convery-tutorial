extends Camera2D

var _target_zoom : float = 1 

@export var can_wheel:bool = true #能否控制缩放

@export var can_key:bool = true#能否利用按键控制缩放
@export var can_drag :bool = true#能否控制托拖拽
@export var can_edge :bool = true#能否控制托拖拽
#zoom的增量
@export var ZOOM_IMERMENT : float = 0.1
#zoom的最大值
@export var MIN_ZOOM : float = 0.2
#zoom的最小值
@export var MAX_ZOOM : float = 1

@export var ZOOM_RATE :float = 5.0 

@export var camera_margin : int = 50 #摄像机的边界


@export var camera_speed :  float= 400 #摄像机的移动速度

var _is_zoom_process : bool = false

var _is_dragging : bool = false

var _prev_mouse_pos : Vector2 #上一帧鼠标的位置

var _camera_movement : Vector2  = Vector2.ZERO #相比于上一帧鼠标的距离


func _ready() -> void:
	position_smoothing_speed =5
	position_smoothing_enabled = true
	


func _physics_process(delta: float) -> void:
	if _is_zoom_process and can_wheel :
		zoom = lerp(zoom,_target_zoom * Vector2.ONE,delta*ZOOM_RATE)
		_is_zoom_process = not is_equal_approx(zoom.x,_target_zoom)
		
	if _is_dragging and can_drag:
		_camera_movement = _prev_mouse_pos - get_local_mouse_position()
		

		#鼠标指针在屏幕边缘拖动摄像机
	if can_edge:
		var _rect := get_viewport_rect()#获取屏幕的尺寸，并返回
		var _v := get_local_mouse_position() + _rect.size *0.5		
		if _rect.size.x - _v.x <= camera_margin:
			_camera_movement.x +=camera_speed*delta
		if _rect.size.y - _v.y <= camera_margin:
			_camera_movement.y +=camera_speed*delta
		if _v.x   <= camera_margin:
			_camera_movement.x -=camera_speed*delta
		if  _v.y <= camera_margin:
			_camera_movement.y -=camera_speed*delta	
		
		#键盘拖动摄像机
	if can_key:
		if Input.is_action_pressed("ui_up")	:#如果按下与ui向上的有关的按键时
			_camera_movement.y -= camera_speed*delta
		if Input.is_action_pressed("ui_down")	:#如果按下与ui向上的有关的按键时
			_camera_movement.y += camera_speed*delta
		if Input.is_action_pressed("ui_left")	:#如果按下与ui向上的有关的按键时
			_camera_movement.x -= camera_speed*delta	
		if Input.is_action_pressed("ui_right")	:#如果按下与ui向上的有关的按键时
			_camera_movement.x += camera_speed*delta
	
	position += _camera_movement * zoom #zoom为缩放比率
	
	_camera_movement = Vector2.ZERO #防止相机一直移动
	
	_prev_mouse_pos = get_local_mouse_position()		
#TODO鼠标移动摄像机
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			_zoom_out()
		elif  event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			_zoom_in()
		elif  event.button_index == MOUSE_BUTTON_MASK_RIGHT:
			_is_dragging = true if event.pressed else false  # 有点像三元运算符
			




#TODO摄像机的缩放

func _zoom_in() -> void:
	_target_zoom = max(MIN_ZOOM,_target_zoom - ZOOM_IMERMENT)
	_is_zoom_process = true
	

func _zoom_out() -> void:
	_target_zoom = min(MAX_ZOOM,_target_zoom + ZOOM_IMERMENT)
	_is_zoom_process = true

#TODO摄像机的移动

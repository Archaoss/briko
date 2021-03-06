GDPC                                                                                  res://Ball.tscn p      Y      �[���� 7�2�;   res://Brick.tscn�      G      �˩ų�{��'Q5@X�   res://MainScene.tscn 	      &      \//~�χV�'sE�!�h   res://Paddle.tscn   P      *      O�c�����f?�.�1   res://project.binary�*      ]      ��4���b}�a��Sy�   res://scripts/Ball.gd.remap �)      '       �߆�h�C���r   res://scripts/Ball.gdc  �      �      {2j�iʲ���+�   res://scripts/Brick.gd.remap�)      (       ��^��9��3�ߏ���   res://scripts/Brick.gdc        �      ��u��}��"��kۄ�(   res://scripts/BrickGenerator.gd.remap   *      1       v��G4���dY��NI    res://scripts/BrickGenerator.gdc�      �      ��g-�aЎ�MG���K   res://scripts/Floor.gd.remapP*      (       *��y`���sq����   res://scripts/Floor.gdc �       =      �3���	�r�2�Yƿ    res://scripts/MainScene.gd.remap�*      ,       �͙T&��^���?7H   res://scripts/MainScene.gdc �"      I      ����4�$�:B�u�    res://scripts/Paddle.gd.remap   �*      )       Tr�A17�ڒ4���.   res://scripts/Paddle.gdc@'      j      k���S�~"%2ܧ��[gd_scene load_steps=3 format=2]

[ext_resource path="res://scripts/Ball.gd" type="Script" id=1]

[sub_resource type="CircleShape2D" id=1]

[node name="Ball" type="KinematicBody2D"]
script = ExtResource( 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )

[node name="Tween" type="Tween" parent="."]
       [gd_scene load_steps=3 format=2]

[ext_resource path="res://scripts/Brick.gd" type="Script" id=1]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 30, 10 )

[node name="Brick" type="RigidBody2D"]
modulate = Color( 0, 0.57, 1, 1 )
gravity_scale = 0.0
angular_damp = 0.5
script = ExtResource( 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )

[node name="Outset" type="ColorRect" parent="."]
margin_left = -30.0
margin_top = -10.0
margin_right = 30.0
margin_bottom = 10.0
color = Color( 0.529412, 0.529412, 0.529412, 1 )
__meta__ = {
"_edit_use_anchors_": false
}

[node name="Inset" type="ColorRect" parent="."]
margin_left = -29.0
margin_top = -9.0
margin_right = 29.0
margin_bottom = 9.0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="Tween" type="Tween" parent="."]
         [gd_scene load_steps=8 format=2]

[ext_resource path="res://Paddle.tscn" type="PackedScene" id=1]
[ext_resource path="res://Ball.tscn" type="PackedScene" id=2]
[ext_resource path="res://scripts/BrickGenerator.gd" type="Script" id=3]
[ext_resource path="res://scripts/MainScene.gd" type="Script" id=4]
[ext_resource path="res://scripts/Floor.gd" type="Script" id=5]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 10, 300 )

[sub_resource type="RectangleShape2D" id=2]
extents = Vector2( 512, 10 )

[node name="MainScene" type="Node2D"]
script = ExtResource( 4 )

[node name="Paddle" parent="." instance=ExtResource( 1 )]
position = Vector2( 512, 560 )

[node name="BrickGenerator" type="Node2D" parent="."]
position = Vector2( 512, 230 )
script = ExtResource( 3 )
gridSize = Vector2( 10, 8 )

[node name="Walls" type="Node2D" parent="."]

[node name="LeftWall" type="StaticBody2D" parent="Walls"]
position = Vector2( -10, 300 )
collision_layer = 3
collision_mask = 3

[node name="CollisionShape2D" type="CollisionShape2D" parent="Walls/LeftWall"]
shape = SubResource( 1 )

[node name="RightWall" type="StaticBody2D" parent="Walls"]
position = Vector2( 1034, 300 )
collision_layer = 3
collision_mask = 3

[node name="CollisionShape2D" type="CollisionShape2D" parent="Walls/RightWall"]
shape = SubResource( 1 )

[node name="Ceiling" type="StaticBody2D" parent="Walls"]
position = Vector2( 512, -10 )
collision_layer = 3
collision_mask = 3

[node name="CollisionShape2D" type="CollisionShape2D" parent="Walls/Ceiling"]
shape = SubResource( 2 )

[node name="Floor" type="Area2D" parent="Walls"]
position = Vector2( 512, 610 )
collision_layer = 3
collision_mask = 3
script = ExtResource( 5 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="Walls/Floor"]
shape = SubResource( 2 )

[node name="ScoreLabel" type="Label" parent="."]
margin_left = 20.0
margin_top = 20.0
margin_right = 61.8232
margin_bottom = 14.0
text = "Score: %s"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="Ball" parent="." instance=ExtResource( 2 )]
position = Vector2( 511, 458 )
          [gd_scene load_steps=3 format=2]

[ext_resource path="res://scripts/Paddle.gd" type="Script" id=1]

[sub_resource type="CapsuleShape2D" id=1]
height = 89.4186

[node name="Paddle" type="KinematicBody2D"]
script = ExtResource( 1 )

[node name="ColorRect" type="ColorRect" parent="."]
margin_left = -50.0
margin_top = -10.0
margin_right = 50.0
margin_bottom = 10.0
grow_horizontal = 2
grow_vertical = 2
__meta__ = {
"_edit_use_anchors_": false
}

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
rotation = 1.5708
shape = SubResource( 1 )
      GDSC   "      .   4     ������������τ�   ����Ҷ��   ���Ŷ���   ����������������Ŷ��   ��������ض��   ����������Ŷ   �������ض���   �����϶�   ��������   ��������   ����������Ӷ   ����Ӷ��   ���϶���   ���������������Ŷ���   ����׶��   ��ڶ   ��������ض��   ���������������Ӷ���   �������Ķ���   ����������ƶ   ��������ݶ��   ����ݶ��   �������¶���   �����Ӷ�   �����ڶ�   ��߶   ϶��   ζ��   �������ڶ���   ����ض��   �������������������϶���   �������Ӷ���   �������Ӷ���   �����������Ķ���   ,     
            	                bricks        modulate                   timeout                                
                              %   	   &   
   '      -      1      2      3      9      F      W      X      Y      b      l      v      w      {      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %      &     '     (     )     *     +   !  ,   1  -   2  .   3YY8;�  VY8;�  V�  Y8;�  V�  YY;�  V�  Y5;�  V�  YYY0�  PQV�  �  PQYYY0�	  PQV�  �
  P�  PQR�  R�  T�  Q�  �
  P�  P�  R�  QR�  R�  T�  QYYY0�  P�  V�  QV�  ;�  V�  �  �  �  ;�  �  P�  R�  Q�  �  &�  V�  &�  T�  T�  P�  QV�  ;�  �  T�  <�  �  �  T�  P�  R�  �  Q�  �  �  �  T�  P�  T�  Q�  ;�  V�	  P�  T�  R�  T�  Q�  �  �+  P�(  P�  R�  QQ�  �  �  P�  P�  QRP�  QQYYY0�  PQV�  W�  T�  PR�  R�  R�  P�  R�  R�  R�  QR�  Q�  AP�   PQT�!  P�  QR�	  Q�  �  PQYYY0�  PQV�  �  �  �  ;�  V�(  PZ�
  RZ�  �
  Q�  �  �  P�  P�  QRP�  QQYY`        GDSC            u      ��������τ�   ����ݶ��   ��������Ҷ��   �����϶�   �����������ƶ���   �������¶���   ������¶   �������۶���   ����������ڶ   ��������������Ķ   �������������ݶ�   ������������Ӷ��   ������ζ   ��������������϶   ���Ŷ���   �������������������Ӷ���   ��������������ض   ����Ŷ��   ����ض��   �������������������϶���   �������Ӷ���   ����¶��      bricks     	   destroyed            
         modulate                                            
                     	      
               &      +      ,      0      4      8      =      >      D      E      S      l      s      3YY2�  YYB�  YYY0�  PQV�  �  PQY�  Y0�  P�  V�  R�  V�  QV�  �  P�  Q�  �  �	  �  �  �
  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  PP�  �  QT�  P�  QQ�  W�  T�  PR�  R�  R�  P�  R�  R�  R�  QR�  Q�  W�  T�  PQY`        GDSC      	      x      ���Ӷ���   �������Ӷ���   ����ݶ��   �����϶�   ߶��   ζ��   ܶ��   ϶��   Զ��   �������Ӷ���   ������¶   �������Ӷ���   �������ض���   ��������Ҷ��   
         res://Brick.tscn         	   destroyed         /root/MainScene       _on_brick_destroyed    P      (      #                                                     4   	   H   
   Q      _      p      u      v      3YY8;�  V�  PRQYY5;�  �L  P�  QYY0�  PQV�  )�  �K  P�  T�  �  R�  T�  �  QV�  )�  �K  P�  T�  �  R�  T�  �  QV�  ;�  �  T�	  PQ�  �  T�
  P�  R�  P�  QR�  Q�  �  T�  �  P�  �  �  R�  �  Q�  �  P�  QYY`           GDSC            E      ���ׄ�   ��������ڶ��   �����϶�   ���Ķ���   ������¶   ���������������Ҷ���   ���϶���   ����������τ򶶶   ���Ӷ���   ����������ڶ   ����������ƶ   ���������Ӷ�      body_entered      _on_body_entered      Ball   	   ball_fall         bricks                                       	               	      
         &      .      3      4      =      C      3YYYB�  YYY0�  PQV�  ;�  �  PRR�  QYYY0�  P�  V�  QV�  &�  T�  �  V�  �	  P�  Q�  �  &�  T�
  P�  QV�  �  T�  PQY`   GDSC         %   �      ���ӄ�   ����Ӷ��   ����������ڶ   ����ڶ��   ���������ڶ�   �����������¶���   ���¶���   ����¶��   �����϶�   ���Ķ���   ����Ŷ��   ����Ķ��   ������¶   ���ڶ���   �����������������ڶ�   ������������������Ҷ   �������������������¶���   ����¶��   ����������������Ҷ��   �������Ӷ���   ���¶���   ������������ڶ��          	   ball_fall         _on_fall      _on_ball_fall      
         ui_quit                    	      
                           	   $   
   (      )      *      0      3      D      T      X      Y      Z      `      d      h      i      j      q      z      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   3YY;�  VYY5;�  V�  W�  Y5;�  V�  T�  YYY0�  PQV�  �%  PQYYY0�  PQV�  ;�	  �  �	  W�
  �  T�  P�  RW�  R�  Q�  �	  W�
  �  T�  P�  RR�  Q�  �  PQ�  YY0�  PQV�  �  �  �  �  PQ�  �  Y0�  P�  QV�  &�  T�  P�  QV�  �  PQT�  PQYYY0�  PQV�  �  �  �  PQYYY0�  PQV�  �  T�  �  �  Y`       GDSC            ^      ������������τ�   ����Ҷ��   ����������Ŷ   �������ض���   �������Ŷ���   ����׶��   ��ڶ   ����¶��   ����������������Ҷ��   ����ڶ��   ���������������Ӷ���   ϶��   �        paddle_left              paddle_right                   
                        !      "   	   +   
   5      6      ?      H      I      S      T      \      3YY8;�  VY5;�  V�  YY0�  P�  QV�  ;�  V�  PQ�  �  &�  T�  P�  QV�  �  �  P�  R�  Q�  �  &�  T�  P�  QV�  �  �  P�  R�  Q�  �  ;�	  �
  P�  �  Q�  �  �  T�  �  T�  Y`      [remap]

path="res://scripts/Ball.gdc"
         [remap]

path="res://scripts/Brick.gdc"
        [remap]

path="res://scripts/BrickGenerator.gdc"
               [remap]

path="res://scripts/Floor.gdc"
        [remap]

path="res://scripts/MainScene.gdc"
    [remap]

path="res://scripts/Paddle.gdc"
       ECFG      _global_script_classes�                     class         Brick         language      GDScript      path      res://scripts/Brick.gd        base      RigidBody2D    _global_script_class_icons                Brick             application/config/name         briko      application/run/main_scene         res://MainScene.tscn   input/paddle_left�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   Q      unicode           echo          script            InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script         input/paddle_right�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   D      unicode           echo          script            InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script         input/ui_quit`              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control          meta          command          pressed           scancode   C      unicode           echo          script         locale/locale_filter                         
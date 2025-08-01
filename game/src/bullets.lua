--[[pod_format="raw",created="2025-07-17 06:51:51",modified="2025-08-01 10:40:21",revision=64]]
function _bullets_init()
	bullets = {}
end

function spawn_bullet(x, y, dir)
	if (dir == 0) s = 27; h_flip = true; v_flip = false;
	if (dir == 1) s = 27; h_flip = false; v_flip = false;
	if (dir == 2) s = 26; h_flip = false; v_flip = false;
	if (dir == 3) s = 26; h_flip = false; v_flip = true;

	add(bullets, { x = x, y = y, dir = dir, s = s, h_flip = h_flip, v_flip = v_flip })
end

function _bullets_update()
	for bullet in all(bullets) do
		-- despawn bullet on collision
		if (bullet.dir == 0 and collides_left(bullet.x, bullet.y, flags.wall)) del(bullets, bullet)
		if (bullet.dir == 1 and collides_right(bullet.x, bullet.y, flags.wall)) del(bullets, bullet)
		if (bullet.dir == 2 and collides_up(bullet.x, bullet.y, flags.wall)) del(bullets, bullet)
		if (bullet.dir == 3 and collides_down(bullet.x, bullet.y, flags.wall)) del(bullets, bullet)

		if (bullet.dir == 0) bullet.x -= 3
		if (bullet.dir == 1) bullet.x += 3
		if (bullet.dir == 2) bullet.y -= 3
		if (bullet.dir == 3) bullet.y += 3
	end
end

function _bullets_draw()
	for bullet in all(bullets) do
		spr(bullet.s, bullet.x, bullet.y, bullet.h_flip, bullet.v_flip)
	end
end
#region inherit

	event_inherited();

#endregion

#region functions

	#region Pass_Uniforms
	
		Pass_Uniforms = function(){												
			shader_set_uniform_f(u_time, timeVariable);
			shader_set_uniform_f(u_intensity, intensity);
			timeVariable += animationSpeed;
		}
	
	#endregion

#endregion

#region declarations
	
	shader      = sha_rgb_noise;
	intensity   = desired_intensity;
	u_time = shader_get_uniform(shader, "time");
	u_intensity = shader_get_uniform(shader, "intensity");

#endregion
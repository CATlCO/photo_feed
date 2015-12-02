module FlickrHelper

	def user_photos(user_id, photo_count = 8)
		flickr = Flickr.new('config/flickr.yml')
		flickr.photos.search(user_id: user_id).values_at(0..(photo_count - 1))
	end

	def render_flickr_sidebar(user_id, photo_count = 8, columns = 4)
		begin
			photos = user_photos(user_id, photo_count).in_groups_of(4)
			render :partial => '/flickr/sidebar', :locals => { :photos => photos }
		rescue Exception
			render :partial => '/flickr/unavailable'
		end
	end
	
end
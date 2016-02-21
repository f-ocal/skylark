≈class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :user, index: true

      t.string :title, null: false
      t.string :tileset, null: false
      t.float :marker_lat, null: false
      t.float :marker_long, null: false
      t.date :date_taken
      t.text :description
      t.string :camera_type

      t.timestamps null: false
    end
  end
end

<div class="pin-left col12" style="height:200px;background-size:cover;background-position:50%;background-image:url(https://api.mapbox.com/v4/karlaking2.8kwtn5pq/-85.59478044867362,44.777045092220206,10/1200x200.png?access_token=tk.eyJ1Ijoic2hhd25zcGVhcnMiLCJleHAiOjE0NTYwNzk3ODQsImlhdCI6MTQ1NjA3NjE4Mywic2NvcGVzIjpbImVzc2VudGlhbHMiLCJzY29wZXM6bGlzdCIsIm1hcDpyZWFkIiwibWFwOndyaXRlIiwidXNlcjpyZWFkIiwidXNlcjp3cml0ZSIsInVwbG9hZHM6cmVhZCIsInVwbG9hZHM6bGlzdCIsInVwbG9hZHM6d3JpdGUiLCJzdHlsZXM6dGlsZXMiLCJzdHlsZXM6cmVhZCIsImZvbnRzOnJlYWQiLCJzdHlsZXM6d3JpdGUiLCJzdHlsZXM6bGlzdCIsInN0eWxlczpkcmFmdCIsImZvbnRzOmxpc3QiLCJmb250czp3cml0ZSIsImZvbnRzOm1ldGFkYXRhIiwiZGF0YXNldHM6cmVhZCIsImRhdGFzZXRzOndyaXRlIl0sImNsaWVudCI6Im1hcGJveC5jb20ifQ.x7LkmJIFXQuuySPhr-3Dag);" data-reactid=".1.0.0.0.0.0"></div>

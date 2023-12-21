Trip.create(user_id: 1, start_date: 20001207, end_date: 20231221, location: "Spain")
Trip.create(user_id: 1, start_date: 20001207, end_date: 20231221, location: "London")
Trip.create(user_id: 1, start_date: 20001207, end_date: 20231221, location: "Australia")

JournalEntry.create(title: "Exploring New Horizons",
                    date: 20231210,
                    entry: "Today marked the beginning of an exciting journey. I ventured into the heart of the forest, witnessing nature's beauty unfold before my eyes. The serene atmosphere and the sounds of wildlife were truly captivating.",
                    trip_id: 1,
                    user_id: 1,
                    public: true)

JournalEntry.create(title: "City Lights and Discoveries",
                    date: 20231215,
                    entry: "The city streets buzzed with energy as I explored every nook and corner. From vibrant markets to historical landmarks, each discovery added a new dimension to my adventure.",
                    trip_id: 2,
                    user_id: 2,
                    public: true)

JournalEntry.create(title: "A Day by the Shore",
                    date: 20231215,
                    entry: "The soothing waves kissed the shore as I basked in the sun's warmth. Seagulls soared overhead, painting a picturesque scene. The tranquil ambiance provided the perfect escape from the bustling city life.",
                    trip_id: 1,
                    user_id: 3,
                    public: false)

Place.create(
  trip_id: 1,
  user_id: 1,
  name: "Sunset Viewpoint",
  date: 20231208,
  address: "123 Main Street, Cityville, State, Country",
)
Place.create(
  trip_id: 2,
  user_id: 2,
  name: "Local Cafe",
  date: 20231216,
  address: "456 Park Avenue, Townsville, State, Country",
)
Place.create(
  trip_id: 3,
  user_id: 1,
  name: "Mountain Lodge",
  date: 20231124,
  address: "789 Mountain Road, Summit City, State, Country",
)
Place.create(
  trip_id: 1,
  user_id: 3,
  name: "Seaside Restaurant",
  date: 20231217,
  address: "101 Beachside Boulevard, Coastal Town, State, Country",
)

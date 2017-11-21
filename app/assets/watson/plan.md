# IBM Watson Conversation Service Specification

## Introduction
The IBM Watson™ Conversation service combines machine learning, natural language understanding, and integrated dialog tools to create conversation flows between your apps and your The service utilises intents, entities, and diologs. In addition to explanining these concepts, the specific forms for intents, entities, and dialogs that are expected in the Impersonation Game, are detailed here.

## Background
When we say **agent** we are referring to an arbitrary instance of a Watson Conversation Service agent. So for example, if we say *"Consider agents X and Y..."*, then *X* and *Y* are two different conversation service instances.

Consider an agent *A*. At the most abstract level, *A* will receive a some input message *M* and then generate some output message *O* based on the properties *P* of *M*. These properties *P* can take the form of either intents or entities, describing the specific context of a given user input.

**Intents** are purposes or goals expressed in a customer's input, such as answering a question or processing a bill payment. By recognizing the intent expressed in a customer's input, the Conversation service can choose the correct dialog flow for responding to it. For example if we consider the message *M*="Where is the nearest Wal-Mart?", then the intent *I* for *M* would be *I*=Find the nearest Wal-Mart to the user's location.

**Entities** represent a class of object or a data type that is relevant to a user's purpose. If we return to our example of the message *M*="Where is te nearest Wal-Mart?", then the following items could be entiites:

- Location
- Distance
- Type of Store
- Store Hour's

In short, entities are specific pieces of information that provide extra context and relevance for a user's purpose. They allow us to be able to generate responses which provide the user with *specific* details that they need.

**Dialogs**

## Specification
In this section we list some of the core intents, entities, and dialogs that will be used in the imitation game. These items will go on to define how we will construct and define IBM Watson's Conversation Engine in order to meet the specifications and requirements of the Impersonation Game. Specifically, the items that we list in the "intents" and "entities" sections will go on to be defined in CSV files (named intents and entiites respectively), which will then be imported into the IBM Watson Conversation Service web-broswer application. Although it is not possible to enumarate *all* possibile intents and entities which describe *any* possible question a user may ask, we can attempt to capture the most generalised properties which will allow IBM Watson to utilise Machine Learning techniques in order to address new user input message stimuli. In other words, by completely defining the most general properties of the possible generated questions for the Impersonation Game, using Machine Learning techniques, we will be able to (in principle and with some possible error value *e*) generate an appropriate response to the aforementioned question.

### Intents
1. colours
2. geography
3. actors
4. movies
5. food
6. music
7. musical_artist
8. sports
9. cars
10. companies
11. universities
12. clothes
13. video_games
14. tv

### Entities
The following list details the entities corresponding to the intents from the previous section. For example, "shade" listed in 1. is an entity for the intent "colours".
1. shade, hue, format, color_base
2. location, demographics, weather_conditions, country, continent, currency, economy
3. action, horror, a_list, b_list, hollywood
4. box_office, suspense, mystery, drama,
5. north_american, european, african, caribbean, asian, oriental, south_american, spicy, sweet, sour, calories, type, ingredients, preparation
6. genre, musical_features, loud, quiet, long, short, composition_date
7. performance_type, live, recording, alive, passed_away, performance_genre
8. type, fanbase, rules, governing_orgnisation, players, equipment, field, stadium, olympic_sport
9. make, model, manufacturer, price, energy_source, speed, gas_mileage
10. technology, medicine, agriculture, fashion, grocer, super_market, delivery, online, in_person
11. undergraduate, graduate, post_doc, departments, faculties, schools, professors, instructors, lecturers
12. female, male, shoes, hats, shirts, pants, shorts, jackets, under_wear, sleep_wear, accessories
13. multiplayer, single_player, esrb_rating, comptetitions, free, paid
14. network, channel_name, series_name

### Dialog
##### colours
if (@colours:shade) then  "Dark red is the best colour in the world, and anyone who disagrees is wrong."
if (@colours:hue)
if (@colours:format)
if (@colours:color_base)

#### geography

#### actors

#### movies

#### food

#### music

#### musical_artist

#### sports

#### cars

#### companies

#### universities

#### clothes

#### video_games

#### tv

### Dialog Synatx
#### Conditions
| Condition name     | Description         |
| ------------------ | :------------------ |
| anything_else	     | You can use this condition at the end of a dialog, to be processed when the user input does not match any other dialog nodes. The Anything else node is triggered by this condition.
| conversation_start | Like welcome, this condition is evaluated as true during the first dialog turn. Unlike welcome, it is true whether or not the initial request from the application contains user input. A node with the conversation_start condition can be used to initialize context variables or perform other tasks at the beginning of the dialog.
| false              | This condition is always evaluated to false. You might use this at the top of a branch that is under development, to prevent it from being used, or as the condition for a node that provides a common function and is used only as the target of a Jump to action.
| irrelevant         | This condition will evaluate to true if the user’s input is determined to be irrelevant by the Conversation service.
| true               | This condition is always evaluated to true. You can use it at the end of a list of nodes or responses to catch any responses that did not match any of the previous conditions.
| welcome            | This condition is evaluated as true during the first dialog turn (when the conversation starts), only if the initial request from the application does not contain any user input. It is evaluated as false in all subsequent dialog turns. The Welcome node is triggered by this condition. Typically, a node with this condition is used to greet the user, for example, to display a message such as "Welcome to our Pizza ordering app."
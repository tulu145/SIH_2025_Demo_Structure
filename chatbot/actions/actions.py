from typing import Any, Text, Dict, List
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
import os
import requests


class ActionGetDiseaseInfo(Action):
    def name(self) -> Text:
        return "action_get_disease_info"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        disease = tracker.get_slot("disease") or "fever"
        backend_url = os.getenv("BACKEND_URL", "http://localhost:3000")
        # Placeholder response until backend health endpoint exists
        dispatcher.utter_message(text=f"Info about {disease}. More details coming soon.")
        return []


class ActionGetVaccinationSchedule(Action):
    def name(self) -> Text:
        return "action_get_vaccination_schedule"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        dispatcher.utter_message(text="Vaccination schedule feature is coming soon.")
        return []


